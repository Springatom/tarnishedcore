class Item < ApplicationRecord
  belongs_to :user
  enum kind: { income: 1, expenses: 0 }

  validates :amount, presence: true
  validates :kind, presence: true
  validates :tag_ids, presence: true
  validates :happened_at, presence: true

  # 注意这里没有 s ， 是一个自定义检查 
  validate :check_tag_ids_belong_to_user

  def check_tag_ids_belong_to_user
    all_tag_ids = Tag.where({ user_id: self.user_id }).map(&:id)
    if self.tag_ids & all_tag_ids != self.tag_ids
      self.errors.add :tag_ids, '使用了错误的标签'
    end
  end

end
