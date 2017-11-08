defmodule CodeCorps.GithubPullRequestTest do
  use CodeCorps.ModelCase

  alias CodeCorps.GithubPullRequest

  @valid_attrs %{
    github_created_at: "2075-05-05T23:40:27Z",
    github_id: 34778301,
    github_updated_at: "2075-05-05T23:40:27Z",
    html_url: "https://github.com/baxterthehacker/public-repo/pull/1",
    locked: false,
    merged: false,
    number: 1,
    state: "open",
    title: "Update the README with new information",
    url: "https://api.github.com/repos/baxterthehacker/public-repo/pulls/1"
  }
  @invalid_attrs %{}

  describe "changeset/2" do
    test "with merged set" do
      attrs = @valid_attrs |> Map.put(:merged, true)
      changeset = GithubPullRequest.changeset(%GithubPullRequest{}, attrs)
      assert changeset.valid?
      assert changeset.changes[:merged] == true
    end

    test "with merged_at set" do
      attrs = @valid_attrs |> Map.put(:merged_at, Timex.now) |> Map.delete(:merged)
      changeset = GithubPullRequest.changeset(%GithubPullRequest{}, attrs)
      assert changeset.valid?
      assert changeset.changes[:merged] == true
    end

    test "with neither merged nor merged_at set" do
      attrs = @valid_attrs |> Map.delete(:merged) |> Map.delete(:merged_at)
      changeset = GithubPullRequest.changeset(%GithubPullRequest{merged: true}, attrs)
      assert changeset.valid?
      assert changeset.changes[:merged] == false
    end
  end

  describe "create_changeset/2" do
    test "with valid attributes" do
      changeset = GithubPullRequest.create_changeset(%GithubPullRequest{}, @valid_attrs)
      assert changeset.valid?
    end

    test "with invalid attributes" do
      changeset = GithubPullRequest.create_changeset(%GithubPullRequest{}, @invalid_attrs)
      refute changeset.valid?
    end
  end
end
