class Puzzle < ActiveRecord::Base
  has_many :submissions
  has_many :comments

  def file=(tempfile)
    write_attribute :fingerprint, sha1(tempfile)
  end

  # FIXME: there must be a simpler way…
  def solution_count
    submissions.select(&:correct).map(&:user).uniq.size
  end

  # FIXME: should the below be done with scopes?
  def solved_by?(user)
    submissions.select(&:correct).any? { |s| s.user == user }
  end

  def valid_solution?(tempfile)
    fingerprint == sha1(tempfile)
  end

  private

  def sha1(tempfile)
    Digest::SHA1.hexdigest(tempfile.read)
  end
end
