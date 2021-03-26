class Url < ApplicationRecord
    has_many :url_visits, dependent: :destroy

    before_validation :create_shortened_url


    # Format the original URL
    def original_url_formatted
        url = URI.parse(original_url)
        if url.scheme.present?
            original_url
        else
            'http://' + url.path
        end
    end


    private

        def create_shortened_url
            loop do
                self.shortened_url = SecureRandom.hex(2)
                break if Url.where(shortened_url: self.shortened_url).empty?
              end      
        end

end
