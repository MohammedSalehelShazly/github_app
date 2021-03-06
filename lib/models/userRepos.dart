

import 'package:flutter/cupertino.dart';

class UserRepos{

  List<Repo> repos;
  UserRepos({@required this.repos});

  factory UserRepos.fromRes(List<dynamic> data)=>
      UserRepos(
        repos: List.from(data.map((e) => Repo.fromJson(e)))
      );
}


class Repo {
  Repo({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.archiveUrl,
    this.assigneesUrl,
    this.blobsUrl,
    this.branchesUrl,
    this.collaboratorsUrl,
    this.commentsUrl,
    this.commitsUrl,
    this.compareUrl,
    this.contentsUrl,
    this.contributorsUrl,
    this.deploymentsUrl,
    this.downloadsUrl,
    this.eventsUrl,
    this.forksUrl,
    this.gitCommitsUrl,
    this.gitRefsUrl,
    this.gitTagsUrl,
    this.gitUrl,
    this.issueCommentUrl,
    this.issueEventsUrl,
    this.issuesUrl,
    this.keysUrl,
    this.labelsUrl,
    this.languagesUrl,
    this.mergesUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.pullsUrl,
    this.releasesUrl,
    this.sshUrl,
    this.stargazersUrl,
    this.statusesUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.tagsUrl,
    this.teamsUrl,
    this.treesUrl,
    this.cloneUrl,
    this.mirrorUrl,
    this.hooksUrl,
    this.svnUrl,
    this.homepage,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.watchersCount,
    this.size,
    this.defaultBranch,
    this.openIssuesCount,
    this.isTemplate,
    this.topics,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
    this.hasPages,
    this.hasDownloads,
    this.archived,
    this.disabled,
    this.visibility,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.allowRebaseMerge,
    this.templateRepository,
    this.tempCloneToken,
    this.allowSquashMerge,
    this.allowAutoMerge,
    this.deleteBranchOnMerge,
    this.allowMergeCommit,
    this.subscribersCount,
    this.networkCount,
    //this.license,
    this.forks,
    this.openIssues,
    this.watchers,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  Owner owner;
  bool private;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String archiveUrl;
  String assigneesUrl;
  String blobsUrl;
  String branchesUrl;
  String collaboratorsUrl;
  String commentsUrl;
  String commitsUrl;
  String compareUrl;
  String contentsUrl;
  String contributorsUrl;
  String deploymentsUrl;
  String downloadsUrl;
  String eventsUrl;
  String forksUrl;
  String gitCommitsUrl;
  String gitRefsUrl;
  String gitTagsUrl;
  String gitUrl;
  String issueCommentUrl;
  String issueEventsUrl;
  String issuesUrl;
  String keysUrl;
  String labelsUrl;
  String languagesUrl;
  String mergesUrl;
  String milestonesUrl;
  String notificationsUrl;
  String pullsUrl;
  String releasesUrl;
  String sshUrl;
  String stargazersUrl;
  String statusesUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String tagsUrl;
  String teamsUrl;
  String treesUrl;
  String cloneUrl;
  String mirrorUrl;
  String hooksUrl;
  String svnUrl;
  String homepage;
  dynamic language;
  int forksCount;
  int stargazersCount;
  int watchersCount;
  int size;
  String defaultBranch;
  int openIssuesCount;
  bool isTemplate;
  List<String> topics;
  bool hasIssues;
  bool hasProjects;
  bool hasWiki;
  bool hasPages;
  bool hasDownloads;
  bool archived;
  bool disabled;
  String visibility;
  DateTime pushedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Permissions permissions;
  bool allowRebaseMerge;
  dynamic templateRepository;
  String tempCloneToken;
  bool allowSquashMerge;
  bool allowAutoMerge;
  bool deleteBranchOnMerge;
  bool allowMergeCommit;
  int subscribersCount;
  int networkCount;
  //License license;
  int forks;
  int openIssues;
  int watchers;

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    owner: Owner.fromJson(json["owner"]),
    private: json["private"],
    htmlUrl: json["html_url"],
    description: json["description"],
    fork: json["fork"],
    url: json["url"],
    archiveUrl: json["archive_url"],
    assigneesUrl: json["assignees_url"],
    blobsUrl: json["blobs_url"],
    branchesUrl: json["branches_url"],
    collaboratorsUrl: json["collaborators_url"],
    commentsUrl: json["comments_url"],
    commitsUrl: json["commits_url"],
    compareUrl: json["compare_url"],
    contentsUrl: json["contents_url"],
    contributorsUrl: json["contributors_url"],
    deploymentsUrl: json["deployments_url"],
    downloadsUrl: json["downloads_url"],
    eventsUrl: json["events_url"],
    forksUrl: json["forks_url"],
    gitCommitsUrl: json["git_commits_url"],
    gitRefsUrl: json["git_refs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitUrl: json["git_url"],
    issueCommentUrl: json["issue_comment_url"],
    issueEventsUrl: json["issue_events_url"],
    issuesUrl: json["issues_url"],
    keysUrl: json["keys_url"],
    labelsUrl: json["labels_url"],
    languagesUrl: json["languages_url"],
    mergesUrl: json["merges_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    pullsUrl: json["pulls_url"],
    releasesUrl: json["releases_url"],
    sshUrl: json["ssh_url"],
    stargazersUrl: json["stargazers_url"],
    statusesUrl: json["statuses_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    tagsUrl: json["tags_url"],
    teamsUrl: json["teams_url"],
    treesUrl: json["trees_url"],
    cloneUrl: json["clone_url"],
    mirrorUrl: json["mirror_url"],
    hooksUrl: json["hooks_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"],
    language: json["language"],
    forksCount: json["forks_count"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    size: json["size"],
    defaultBranch: json["default_branch"],
    openIssuesCount: json["open_issues_count"],
    isTemplate: json["is_template"],
    topics: List<String>.from(json["topics"].map((x) => x)),
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    hasDownloads: json["has_downloads"],
    archived: json["archived"],
    disabled: json["disabled"],
    visibility: json["visibility"],
    pushedAt: DateTime.parse(json["pushed_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    permissions: Permissions.fromJson(json["permissions"]),
    allowRebaseMerge: json["allow_rebase_merge"],
    templateRepository: json["template_repository"],
    tempCloneToken: json["temp_clone_token"],
    allowSquashMerge: json["allow_squash_merge"],
    allowAutoMerge: json["allow_auto_merge"],
    deleteBranchOnMerge: json["delete_branch_on_merge"],
    allowMergeCommit: json["allow_merge_commit"],
    subscribersCount: json["subscribers_count"],
    networkCount: json["network_count"],
    // license: License.fromJson(json["license"]),
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
  );

}

class License {
  License({
    this.key,
    this.name,
    this.url,
    this.spdxId,
    this.nodeId,
    this.htmlUrl,
  });

  String key;
  String name;
  String url;
  String spdxId;
  String nodeId;
  String htmlUrl;

  factory License.fromJson(Map<String, dynamic> json) => License(
    key: json["key"],
    name: json["name"],
    url: json["url"],
    spdxId: json["spdx_id"],
    nodeId: json["node_id"],
    htmlUrl: json["html_url"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "url": url,
    "spdx_id": spdxId,
    "node_id": nodeId,
    "html_url": htmlUrl,
  };
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "site_admin": siteAdmin,
  };
}

class Permissions {
  Permissions({
    this.admin,
    this.push,
    this.pull,
  });

  bool admin;
  bool push;
  bool pull;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    admin: json["admin"],
    push: json["push"],
    pull: json["pull"],
  );

  Map<String, dynamic> toJson() => {
    "admin": admin,
    "push": push,
    "pull": pull,
  };
}
