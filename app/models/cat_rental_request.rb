class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :cannot_overlap

  belongs_to :cat

  private
    def overlapping_requests
      CatRentalRequest
        .where("end_date > ? AND start_date < ?",
               start_date, end_date)
    end

    def overlapping_approved_requests
      overlapping_requests.where(status: "APPROVED")
    end

    def overlapping_pending_requests
      overlapping_requests.where(status: "PENDING")
    end

    def cannot_overlap
      if overlapping_approved_requests.exists?
        self.errors[:request_date] << "overlaps with approved rental"
      end
    end
end
