Feature: Be Like Matcher
  In order to check whether data structure matches given criteria
  I want to test it against some reference structure
  Which may contain keywords like anything, any_array and so on.

  Scenario: Very Boring Example, Testing Against Exact Simple Object
    Given a file named "simple_spec.rb" with:
      """
        require "spec_helper"

        describe "A nil element" do
          subject{ nil }
          it{ should be_like nil }
          it{ should_not be_like [] }
        end

        describe "A string which is a simple element" do
          subject{ "Once upon a midnight dreary, while I pondered weak and weary," }
          it{ should be_like "Once upon a midnight dreary, while I pondered weak and weary," }
          it{ should_not be_like nil }
        end
      """
    When I run `rspec simple_spec.rb`
    Then the examples should all pass

  Scenario: Using any* matchers
    Given a file named "anystar_spec.rb" with:
      """
        require "spec_helper"

        describe "A string" do
          subject{ "Quoth the raven, 'Nevermore.'" }
          it{ should     be_like any_string }
          it{ should_not be_like "any_string" }
          it{ should_not be_like any_array }
          it{ should     be_like anything }
          it{ should     be_like not_nil }
        end

        describe "Nil" do
          subject{ nil }
          it{ should_not be_like any_array }
          it{ should     be_like anything }
          it{ should_not be_like not_nil }
        end
      """
    When I run `rspec anystar_spec.rb`
    Then the examples should all pass

  Scenario: A Complicated Structure
    Given a file named "complicated_spec.rb" with:
      """
        require "spec_helper"

        describe "An array with hashes and strings and bells and whistles" do
          subject{ [["black", "cat"], nil, {"edgar" => "poe"}] }
          it{ should     be_like any_array }
          it{ should     be_like anything }
          it{ should_not be_like any_hash }
          it{ should     be_like [anything, anything, anything] }
          it{ should_not be_like [anything, anything, anything, anything] }
          it{ should     be_like [any_array, nil, any_hash] }
          it{ should     be_like [["black", "cat"], nil, any_hash] }
          it{ should_not be_like [["cat", "black"], nil, any_hash] }
          it{ should     be_like [anything, nil, {"edgar" => "poe"}] }
          it{ should     be_like [[any_string, "cat"], nil, {"edgar" => any_string}] }
          it{ should_not be_like [[any_string, "cat"], nil, {any_string => "edgar"}] }
        end
      """
    When I run `rspec complicated_spec.rb`
    Then the examples should all pass
