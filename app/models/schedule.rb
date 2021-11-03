class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true
  
    validate :date_before_finish
      def date_before_finish
        return if end_at.blank?
        errors.add(:end_at, "は今日以降の日付で選択して下さい") if end_at < Date.today
      end
  end