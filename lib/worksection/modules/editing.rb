class Worksection::Client
  module Editing

    #https://your-domain.com/api/admin/?action=close_project&page=/project/PROJECT_ID/&hash=HASH
    def close_project(project_id)
      page = "/project/#{project_id}/"
      url = URI("https://#{@domain}/api/admin/?action=close_project&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=activate_project&page=/project/PROJECT_ID/&hash=HASH
    def activate_project(project_id)
      page = "/project/#{project_id}/"
      url = URI("https://#{@domain}/api/admin/?action=activate_project&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=complete_task&page=/project/PROJECT_ID/TASK_ID/&hash=HASH
    def complete_task(project_id, task_id)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=complete_task&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=complete_subtask&page=/project/PROJECT_ID/TASK_ID/SUBTASK_ID/&hash=HASH 
    def complete_subtask(project_id, task_id, subtask_id)
      page = "/project/#{project_id}/#{task_id}/#{subtask_id}/"
      url = URI("https://#{@domain}/api/admin/?action=complete_subtask&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=reopen_task&page=/project/PROJECT_ID/TASK_ID/&hash=HASH 
    def reopen_task(project_id, task_id)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=reopen_task&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=reopen_subtask&page=/project/PROJECT_ID/TASK_ID/SUBTASK_ID/&hash=HASH 
    def reopen_subtask(project_id, task_id, subtask_id)
      page = "/project/#{project_id}/#{task_id}/#{subtask_id}/"
      url = URI("https://#{@domain}/api/admin/?action=reopen_subtask&page=#{page}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=update_project&page=/project=ID_PROJECT/&email_user_to=USER_EMAIL&title=PROJECT_NAME&datestart=DD.MM.YYYY&dateend=DD.MM.YYYY&hash=HASH
    #@option
    def update_project(project_id, **args)
      page = "/project=#{project_id}/"
      url = URI("https://#{@domain}/api/admin/?action=update_project&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=update_task&page=/project/PROJECT_ID/TASK_ID/&email_user_to=USER_EMAIL&title=TASK_NAME&priority=7&datestart=DD.MM.YYYY&dateend=DD.MM.YYYY&hash=HASH
    def update_task(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=update_task&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    def update_subtask(project_id, task_id, subtask_id, **args)
      page = "/project/#{project_id}/#{task_id}/#{subtask_id}/"
      url = URI("https://#{@domain}/api/admin/?action=update_subtask&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=update_timemoney&page=/project/ID_PROJECT/ID_TASK/&id=ID_TIMEMONEY&comment=UPDATED&time=2&is_rate=1&hash=HASH
    def update_timemoney(project_id, task_id, subtask_id = nil, **args)
      page = "/project/#{project_id}/#{task_id}/#{subtask_id}/".gsub('//','/')
      url = URI("https://#{@domain}/api/admin/?action=update_timemoney&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=delete_timemoney&page=/project/ID_PROJECT/ID_TASK/&id=ID_TIMEMONEY&hash=HASH
    def delete_timemoney(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=delete_timemoney&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=subscribe&page=/project/PROJECT_ID/TASK_ID/&email_user=USER_EMAIL&hash=HASH 
    def subscribe(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=subscribe&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=unsubscribe&page=/project/PROJECT_ID/TASK_ID/&email_user=USER_EMAIL&hash=HASH 
    def unsubscribe(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=unsubscribe&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=update_tags&page=/project/PROJECT_ID/TASK_ID/&plus=Tag1,Tag2&minus=Tag3,Tag4&hash=HASH
    def update_tags(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=update_tags&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end
  end
end
