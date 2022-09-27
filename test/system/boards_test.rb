require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase
  setup do
    @board = boards(:one)
  end

  test "visiting the index" do
    visit boards_url
    assert_selector "h1", text: "Boards"
  end

  test "should create board" do
    visit boards_url
    click_on "New board"

    fill_in "Score1", with: @board.score1
    fill_in "Score2", with: @board.score2
    fill_in "Team1", with: @board.team1
    fill_in "Team2", with: @board.team2
    click_on "Create Board"

    assert_text "Board was successfully created"
    click_on "Back"
  end

  test "should update Board" do
    visit board_url(@board)
    click_on "Edit this board", match: :first

    fill_in "Score1", with: @board.score1
    fill_in "Score2", with: @board.score2
    fill_in "Team1", with: @board.team1
    fill_in "Team2", with: @board.team2
    click_on "Update Board"

    assert_text "Board was successfully updated"
    click_on "Back"
  end

  test "should destroy Board" do
    visit board_url(@board)
    click_on "Destroy this board", match: :first

    assert_text "Board was successfully destroyed"
  end
end
