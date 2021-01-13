class Content < ApplicationRecord
	enum Content_type: %i[article video both]
end
