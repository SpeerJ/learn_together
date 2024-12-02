namespace :db do
  desc "Populate flash cards"
  task populate_flash_cards: :environment do
    require "openai"
    prompt = <<~PROMPT
            I would like a short description of how this word ending "-wa" is used in Media Lengua with this function "1s.OBJ". 
      I would also like some flash cards, each with a name, a question asking how to say a particular thing using this word ending or what a particular word with this ending means.  Either the Question or the answer must include actual words with a Spanish base and Kichwa suffix, that are real Media Lengua. No part of the response can contain information on the background of Media Lengua since that is already understood by the student.
      This should all be JSON formatted with a schema 
      { 
        topic: { 
          name: string, 
          description: string, 
          explanation: string,
          flash_cards: [
            {
              name: string, 
              difficulty: number 0 - 1 with a precision of one number after the decimal point, 
              question: string, 
              answers: [
                {value: string, explanation: string}
              ]
            }
          ]
        }
      }
    PROMPT
    client = OpenAI::Client.new(
      access_token: ENV.fetch("OPENAI_ACCESS_TOKEN_LT"),
      log_errors: true
    )

    Subject.find_or_create_by!(
      name: "Media Lengua",
    ).update!(
      description: "A language combining Spanish base words and Kichwa suffixes"
    )

    Conjugations.each do |category, suffixes|
      suffixes.each do |function, suffix|
        next if Topic.find_by(name: function)
        response = client.chat(
          parameters: {
            model: "gpt-4o",
            messages: [{ role: "user", content: [{ type: "text", text: prompt % { suffix:, function: } }] }],
            response_format: { type: "json_object" }
          },
        )

        if response["choices"].nil? || response["choices"].empty?
          puts "Error: No choices returned from OpenAI API."
          next
        end

        # Parse the JSON response
        response_text = response["choices"].first["message"]["content"]
        topic_data = JSON.parse(response_text)["topic"]

        # Create Topic
        topic = Topic.find_or_create_by!(
          name: function,
          description: topic_data["description"],
          explanation: topic_data["explanation"],
          subject_id: Subject.find_by(name: "Media Lengua").id
        )

        # Create Flash Cards and Answers
        topic_data["flash_cards"].each do |flash_card_data|
          flash_card = topic.flash_cards.create!(
            name: flash_card_data["name"],
            description: flash_card_data["question"],
            difficulty: flash_card_data["difficulty"],
            type: "HiddenAnswerFlashCard"
          )

          flash_card_data["answers"].each do |answer_data|
            flash_card.flash_card_answers.create!(
              value: answer_data["value"],
              explanation: answer_data["explanation"],
              correct: true # Adjust if necessary
            )
          end
        end
      end
      # Call the OpenAI API
    end
  end
end