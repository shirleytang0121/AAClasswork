class Album < ApplicationRecord
    validates :title,:yr,:band_id, presence:true
    # validates :designate inclusion:{%w(live studio)}

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end