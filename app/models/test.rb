class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greter_than: 0 }
  validates :level, uniqueness: { scope: :title, message: I18n.t('.level_title_unique_error') }
  validates :published, inclusion: { in: [false], message: I18n.t('.publish_error') },
                        unless: :can_be_published?

  scope :with_questions, -> { where(questions_count: 1..Float::INFINITY) }
  scope :published, -> { where(published: true) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, lambda { |category_name|
                        joins(:category)
                          .where('categories.title' => category_name)
                      }

  scope :tests_by_level, ->(level) { where('tests.level' => level) }

  def self.tests_by_category(category_name)
    by_category(category_name).order(title: :desc).pluck('tests.title')
  end

  private

  def can_be_published?
    questions_count > 0
  end
end
