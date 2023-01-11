class RewardService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    if @test_passage.successfully
      rules_check = RulesService.new(@test_passage)

      all_badges = Badge.all

      test_passage_badges = {}
      all_badges.each do |badge|
        badge_checks = 0
        badge.badge_rules.each do |badge_rule|
          rule_params = badge_rule.parameters_thresholds
          rule_name = Rule.find(badge_rule.rule_id).title
          badge_checks += 1 if rules_check.call(rule_name, rule_params)
        end
        test_passage_badges[badge] = badge.id if badge_checks == badge.badge_rules.count
      end

      test_passage_badges.each do |key, value|
        UserBadge.create(user_id: @user.id, badge_id: value, test_passage_id: @test_passage.id)
      end
    end

  end

end
