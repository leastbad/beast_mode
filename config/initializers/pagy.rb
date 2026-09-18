# frozen_string_literal: true

require "pagy/extras/overflow"

Pagy::DEFAULT[:limit] = 10
Pagy::DEFAULT[:size] = 7
Pagy::DEFAULT[:overflow] = :last_page
