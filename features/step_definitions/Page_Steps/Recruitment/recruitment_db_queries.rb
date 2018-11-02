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
    
    
    def verify_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)
      case recruitment_job_ad_type
        when "Internal"
          query1 = "SELECT * FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_user AS epu ON epa.user_id = epu.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.user_id IS NOT NULL
                  AND epu.email LIKE '%#{candidate_email}%';"

          query2 = "select row_count() as affected;"

          #Executing the select query to verify job appln
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first

        when "External"
          query1 = "SELECT * FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_recruitment_candidate AS epc ON epa.candidate_id = epc.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.candidate_id IS NOT NULL
                  AND epc.email LIKE '%#{candidate_email}%';"

          query2 = "select row_count() as affected;"

          #Executing the select query to verify job appln
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first

        when "Vendor"
          query1 = "SELECT * FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_recruitment_candidate AS epc ON epa.candidate_id = epc.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.candidate_id IS NOT NULL
                  AND epc.id IS NOT NULL
                  AND epc.email LIKE '%#{candidate_email}%';"

          query2 = "select row_count() as affected;"

          #Executing the select query to verify job appln
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first
      end
    end
    
    
    def remove_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)
      case recruitment_job_ad_type
        when "Internal"
          query1 = "DELETE FROM epms_recruitment_job_application WHERE id IN
                  (SELECT id FROM (SELECT epa.id FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_user AS epu ON epa.user_id = epu.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.user_id IS NOT NULL
                  AND epu.email LIKE '%#{candidate_email}%') AS eid);"

          query2 = "select row_count() as affected;"

          #Executing the delete query
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first
        
        when "External"
          query1 = "DELETE FROM epms_recruitment_job_application WHERE id IN
                  (SELECT id FROM (SELECT epa.id FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_recruitment_candidate AS epc ON epa.candidate_id = epc.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.candidate_id IS NOT NULL
                  AND epc.email LIKE '%#{candidate_email}%') AS eid);"

          query2 = "select row_count() as affected;"

          #Executing the delete query
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first
        
        when "Vendor"
          query1 = "DELETE FROM epms_recruitment_job_application WHERE id IN
                  (SELECT id FROM (SELECT epa.id FROM epms_recruitment_job_application AS epa
                  INNER JOIN epms_recruitment_job_ad AS epj ON epa.requisition_id = epj.requisition_id
                  INNER JOIN epms_recruitment_candidate AS epc ON epa.candidate_id = epc.id
                  WHERE epj.title LIKE '%#{recruitment_job_title}%'
                  AND epa.candidate_id IS NOT NULL
                  AND epc.id IS NOT NULL
                  AND epc.email LIKE '%#{candidate_email}%') AS eid);"

          query2 = "select row_count() as affected;"

          #Executing the delete query
          @db.execute(query1)

          #returning the number of rows affected
          return @db[query2].first
      end
    end


    def get_count_candidates()
      query = "select count(*) AS count
               from epms_recruitment_candidate
               where is_active = 1
               and is_deleted = 0"
      return @db[query].first[:count]
    end
  
  end
end
