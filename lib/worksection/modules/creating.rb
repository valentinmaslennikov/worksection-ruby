class Worksection::Client
  module Creating

    #https://your-domain.com/api/admin/?action=post_comment&page=/project/ID_PROJECT/ID_TASK/&email_user_from=USER_EMAIL&text=TEXT&hash=HASH
    def post_comment(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=post_comment&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=post_project&email_user_from=USER_EMAIL&email_manager=USER_EMAIL&email_user_to=USER_EMAIL&members=USER_EMAIL, USER_EMAIL&title=TASK_NAME&text=TASK_TEXT&company=COMPANY&datestart=DD.MM.YYYYY&dateend=DD.MM.YYYYY&hash=HASH
    def post_project(**args)
      url = URI("https://#{@domain}/api/admin/?action=post_project
              #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=post_task&page=/project/PROJECT_ID/&email_user_from=USER_EMAIL&email_user_to=USER_EMAIL&hidden=USER_EMAIL,USER_EMAIL&subscribe=USER_EMAIL,USER_EMAIL&title=TASK_NAME&text=TASK_TEXT&priority=7&datestart=DD.MM.YYYY&dateend= DD.MM.YYYY&tags=Tag1,Tag2&hash=HASH
    def post_task(project_id, **args)
      page = "/project/#{project_id}/"
      url = URI("https://#{@domain}/api/admin/?action=post_task&page=#{page}
                #{collect_params(**args)}
          &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=post_subtask&page=/project/PROJECT_ID/TASK_ID/&email_user_from=USER_EMAIL&email_user_to=USER_EMAIL&hidden=USER_EMAIL,USER_EMAIL&title=SUBTASK_NAME&text=SUBTASK_TEXT&priority=7&datestart=DD.MM.YYYY&dateend=DD.MM.YYYY&tags=Tag1,Tag2&hash =HASH
    def post_subtask(project_id, task_id, **args)
      page = "/project/#{project_id}/#{task_id}/"
      url = URI("https://#{@domain}/api/admin/?action=post_subtask&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=post_timemoney&page=/project/PROJECT_ID/TASK_ID/SUBTASK_ID/&email_user_from=USER_EMAIL&time=TIME&money=MONEY&date=DD.MM.YYYYY&comment=COMMENT&hash=HASH
    def post_timemoney(project_id, task_id, subtask_id, **args)
      page = "/project/#{project_id}/#{task_id}/#{subtask_id}/"
      url = URI("https://#{@domain}/api/admin/?action=post_timemoney&page=#{page}
                #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s, page)}")
      perform_request(url)
    end

    #https://your-domain.com/api/admin/?action=add_user&email=USER_EMAIL&first_name=USER_FIRST_NAME&last_name=USER_LAST_NAME&hash=HASH
    def add_user(**args)
      url = URI("https://#{@domain}/api/admin/?action=add_user
              #{collect_params(**args)}
              &hash=#{to_md5(__method__.to_s)}")
      perform_request(url)
    end
  end
end