module Database_env

  class DAO
    #get req,candidate(shortlisted, interview) and vendor details having vendor submitted candidates
    def get_requisition_vendor_candidates()
      query = "select distinct err.id, requisition_title_display,err.status, erc.first_name, erc.last_name, eu.email, eu.first_name as fn, eu.last_name as ln
               from epms_recruitment_requisition as err
               inner join epms_recruitment_job_application as erja on err.id = erja.requisition_id
               inner join epms_recruitment_candidate erc on erc.id = erja.candidate_id
               inner join epms_user eu on eu.id = erja.vendor_user_id
               where erja.source = 7
               and erja.status in (10,11)
               ORDER BY rand();"
      # query = "select distinct err.id, requisition_title_display, err.status
      #          from epms_recruitment_requisition err
      #          inner join epms_recruitment_job_application erja on err.id = erja.requisition_id
      #          where erja.source = 7
      #          ORDER BY rand();"
      return @db[query].first
    end

  end

end