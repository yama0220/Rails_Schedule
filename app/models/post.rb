class Post < ApplicationRecord
  validates :title, length: { in:1..20 }  #タイトルを最大20文字以内にする
  validates :start_day, presence: true  #開始日必須項目
  validates :end_day, presence: true  #終了日必須項目
  validates :memo, length: { maximum:500 }  #メモを最大500文字以内にする
  validate :day_after_check  #終了日チェック用のバリデーション

  # 終了日チェック用のバリデーション
  def day_after_check
    unless self.start_day == nil || self.end_day == nil
      errors.add(:end_day, 'は、開始日以降の日付を入力してください') if self.start_day > self.end_day
    end
  end
end
