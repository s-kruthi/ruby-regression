module Database_env

  class DAO
    #get req,candidate(shortlisted, interview) and vendor details having vendor submitted candidates
    def get_requisition_vendor_candidates()
      query = "select distinct err.id as req_id, requisition_title_display,err.status as req_status, erc.first_name as candidate_fn, erc.last_name as candidate_ln, eu.email as vendor_mail, eu.first_name as vendor_fn, eu.last_name as vendor_ln
               from epms_recruitment_requisition as err
               inner join epms_recruitment_job_application as erja on err.id = erja.requisition_id
               inner join epms_recruitment_candidate erc on erc.id = erja.candidate_id
               inner join epms_user eu on eu.id = erja.vendor_user_id
               where erja.source = 7
               and erja.status in (10,11)
               and err.is_deleted = 0
               and err.status =1
               and eu.is_active =1
               and eu.is_elmo = 0
               and erc.is_active=1
               and erc.is_deleted=0
               and erja.is_deleted=0
               ORDER BY rand();"
      return @db[query].first
    end


    def get_requisition_details_no_notes()
      query = "select distinct id as req_id, requisition_title_display
              from epms_recruitment_requisition
              where requisition_note is Null
              and status =1
              order by rand();"
      return @db[query].first
    end


    def get_requisition_details_with_notes(status)
      query = "select distinct err.id as req_id, requisition_title_display, requisition_note_updater_id, requisition_note_updated_at, eu.first_name, eu.last_name
             from epms_recruitment_requisition err
             inner join epms_user eu on eu.id = requisition_note_updater_id
             where requisition_note is not Null
             and status =#{status}
             order by rand();"
      return @db[query].first
    end

  end

end