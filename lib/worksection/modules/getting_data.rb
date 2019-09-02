class Worksection::Client
  module GettingData
    #https://your-domain.com/api/admin/?action=get_projects&hash=HASH
    def get_projects(**args)
      url = URI("https://#{@domain}/api/admin/?action=get_projects
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_all_tasks&hash=HASH
    def get_all_tasks(**args)
      url = URI("https://#{@domain}/api/admin/?action=get_all_tasks
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_priority&hash=HASH
    def get_priority(**args)
      url = URI("https://#{@domain}/api/admin/?action=get_priority
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_task&page=/project/PROJECT_ID/TASK_ID/&hash=HASH
    def get_task(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=get_task&page=#{page}
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_tasks&page=/project/PROJECT_ID/&hash=HASH
    def get_tasks(project_id, **args)
      page = "/project/#{project_id}"
      url = URI("https://#{@domain}/api/admin/?action=get_tasks&page=#{page}
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_timemoney&hash=HASH
    def get_timemoney(**args)
      url = URI("https://#{@domain}/api/admin/?action=get_timemoney
                #{collect_params(**args)}
                &hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_comments&page=/project/ID_PROJECT/ID_TASK/&hash=HASH
    def get_comments(project_id, task_id)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=get_comments&page=#{page}&hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=get_users&hash=HASH
    def get_users
      url = URI("https://#{@domain}/api/admin/?action=get_users&hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end
  end
end