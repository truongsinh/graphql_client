// Copyright Thomas Hourlier. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:graphql_client/graphql_dsl.dart';

// ignore_for_file: public_member_api_docs
// ignore_for_file: slash_for_doc_comments

/**
 * ************************
 * ************************
 * ************************
 * **** GQL OPERATIONS ****
 * ************************
 * ************************
 * ************************
 */

class LoginQuery extends Object with Fields implements GQLOperation {
  ViewerResolver viewer = ViewerResolver();

  @override
  String get type => queryType;

  @override
  String get name => 'LoginQuery';

  @override
  List<GQLField> get fields => [viewer];

  @override
  LoginQuery clone() => LoginQuery()..viewer = viewer.clone();
}

class AddTestCommentMutation extends Object
    with Arguments, Fields
    implements GQLOperation {
  AddCommentMutation addComment = AddCommentMutation();

  @override
  String get type => mutationType;

  @override
  String get name => 'AddTestCommentMutation';

  @override
  String get args => '\$issueId: ID!, \$body: String!';

  @override
  List<GQLField> get fields => [addComment];

  @override
  AddTestCommentMutation clone() =>
      AddTestCommentMutation()..addComment = addComment.clone();
}

/**
 * ************************
 * ************************
 * ************************
 * ****** FRAGMENTS *******
 * ************************
 * ************************
 * ************************
 */

class RepositoryDescriptiveFragment
    extends RepositoryDescriptiveFragmentResolver implements GQLFragment {
  @override
  String get onType => 'Repository';
}

class RepositoryIdFragment extends RepositoryIdFragmentResolver
    implements GQLFragment {
  @override
  String get onType => 'Repository';
}

class GistDescriptiveFragment extends GistDescriptiveFragmentResolver
    implements GQLFragment {
  @override
  String get onType => 'Gist';
}

/**
 * ************************
 * ************************
 * ************************
 * ******** FIELDS ********
 * ************************
 * ************************
 * ************************
 */

class AddCommentMutation extends Object
    with Arguments, Fields
    implements GQLField {
  CommentEdgeResolver commentEdge = CommentEdgeResolver();

  @override
  String get name => 'addComment';

  @override
  String get args => 'input: {subjectId: \$issueId, body: \$body}';

  @override
  List<GQLField> get fields => [commentEdge];

  @override
  AddCommentMutation clone() =>
      AddCommentMutation()..commentEdge = commentEdge.clone();
}

class CommentEdgeResolver extends Object
    with Alias, Fields
    implements GQLField {
  NodeResolver node = NodeResolver();

  @override
  String get name => 'commentEdge';

  @override
  List<GQLField> get fields => [node];

  @override
  CommentEdgeResolver clone() => CommentEdgeResolver()
    ..aliasId = aliasId
    ..node = node.clone();
}

class NodeResolver extends Object with Alias, Fields implements GQLField {
  BodyResolver body = BodyResolver();

  @override
  String get name => 'node';

  @override
  List<GQLField> get fields => [body];

  @override
  NodeResolver clone() => NodeResolver()
    ..aliasId = aliasId
    ..body = body.clone();
}

class ViewerResolver extends Object with Alias, Fields implements GQLField {
  GistResolver gist = GistResolver();
  RepositoryResolver repository = RepositoryResolver();
  RepositoriesResolver repositories = RepositoriesResolver();
  LoginResolver login = LoginResolver();
  BioResolver bio = BioResolver();
  BioResolver bio2 = BioResolver();

  @override
  String get name => 'viewer';

  @override
  List<GQLField> get fields =>
      [repositories, gist, repository, login, bio, bio2];

  @override
  ViewerResolver clone() => ViewerResolver()
    ..aliasId = aliasId
    ..gist = gist.clone()
    ..repository = repository.clone()
    ..repositories = repositories.clone()
    ..login = login.clone()
    ..bio = bio.clone()
    ..bio2 = bio2.clone();
}

// @todo cannot `with Fields`
class NodesResolver extends GQLField /*  with Fields  */{
  NameResolver repoName = NameResolver();

  @override
  String get name => 'nodes';

  // @todo cannot `with Fields`
  @override
  List<GQLField> get fields => [repoName];

  @override
  NodesResolver clone() => NodesResolver()..repoName = repoName.clone();
}

class RepositoryResolver extends Object
    with Arguments, Alias, Fields, Fragments
    implements
        RepositoryDescriptiveFragmentResolver,
        RepositoryIdFragmentResolver,
        GQLField {
  final RepositoryDescriptiveFragment _descriptiveRepositoryFragment =
      RepositoryDescriptiveFragment();
  final RepositoryIdFragment _idRepositoryFragment = RepositoryIdFragment();

  CreatedAtResolver createdAt = CreatedAtResolver();

  @override
  DescriptionResolver description;

  @override
  NameResolver repoName;

  @override
  IdResolver id;

  RepositoryResolver() {
    description = _descriptiveRepositoryFragment.description;
    repoName = _descriptiveRepositoryFragment.repoName;
    id = _idRepositoryFragment.id;
  }

  @override
  String get name => 'repository';

  @override
  String get args => 'name: "graphql_client"';

  @override
  List<GQLField> get fields => [createdAt];

  @override
  List<GQLFragment> get fragments =>
      [_descriptiveRepositoryFragment, _idRepositoryFragment];

  RepositoryResolver clone() => RepositoryResolver()
    ..aliasId = aliasId
    ..description = description.clone()
    ..repoName = repoName.clone()
    ..id = id.clone()
    ..createdAt = createdAt.clone();
}

class GistResolver extends Object
    with Arguments, Alias, Fields, Fragments
    implements GistDescriptiveFragmentResolver, GQLField {
  final GistDescriptiveFragment _descriptiveGistFragment =
      GistDescriptiveFragment();

  @override
  DescriptionResolver description;

  GistResolver() {
    description = _descriptiveGistFragment.description;
  }

  @override
  String get name => 'gist';

  @override
  String get args => 'name: "e675723fc16a5b9bd4d1"';

  @override
  List<GQLFragment> get fragments => [_descriptiveGistFragment];

  @override
  GistResolver clone() => GistResolver()
    ..aliasId = aliasId
    ..description = description.clone();
}

class GistDescriptiveFragmentResolver extends Object
    with Fields
    implements GQLField {
  DescriptionResolver description = DescriptionResolver();

  @override
  String get name => 'GistDescriptiveFragment';

  @override
  List<GQLField> get fields => [description];

  @override
  GistDescriptiveFragmentResolver clone() =>
      GistDescriptiveFragmentResolver()..description = description.clone();
}

class RepositoryDescriptiveFragmentResolver extends Object
    with Fields
    implements GQLField {
  DescriptionResolver description = DescriptionResolver();
  NameResolver repoName = NameResolver();

  @override
  String get name => 'RepositoryDescriptiveFragment';

  @override
  List<GQLField> get fields => [description, repoName];

  @override
  RepositoryDescriptiveFragmentResolver clone() =>
      RepositoryDescriptiveFragmentResolver()
        ..description = description.clone()
        ..repoName = repoName.clone();
}

class RepositoryIdFragmentResolver extends Object
    with Fields
    implements GQLField {
  IdResolver id = IdResolver();

  @override
  String get name => 'RepositoryIdFragment';

  @override
  List<GQLField> get fields => [id];

  @override
  RepositoryIdFragmentResolver clone() =>
      RepositoryIdFragmentResolver()..id = id.clone();
}

/**
 * *****************************
 * *****************************
 * *****************************
 * *** COLLECTIONS RESOLVERS ***
 * *****************************
 * *****************************
 * *****************************
 */

class RepositoriesResolver extends Object
    with Arguments, Alias, ScalarCollection<NodesResolver>, Fields
    implements GQLField {
  @override
  NodesResolver nodesResolver = NodesResolver();

  @override
  String get name => 'repositories';

  @override
  String get args => 'first: 5';

  @override
  List<GQLField> get fields => [nodesResolver];

  @override
  RepositoriesResolver clone() => RepositoriesResolver()
    ..aliasId = aliasId
    ..nodesResolver = nodesResolver.clone();
}

/**
 * ************************
 * ************************
 * ************************
 * *** SCALAR RESOLVERS ***
 * ************************
 * ************************
 * ************************
 */

class LoginResolver extends Object
    with Scalar<String>, Alias, Directives
    implements GQLField {
  @override
  String get name => 'login';

  @override
  String get directive => includeDirective;

  @override
  String get directiveValue => 'false';

  @override
  LoginResolver clone() => LoginResolver()..aliasId = aliasId;
}

class BioResolver extends Object
    with Scalar<String>, Alias
    implements GQLField {
  @override
  String get name => 'bio';

  @override
  BioResolver clone() => BioResolver()..aliasId = aliasId;
}

class DescriptionResolver extends Object
    with Scalar<String>, Alias
    implements GQLField {
  @override
  String get name => 'description';

  @override
  DescriptionResolver clone() => DescriptionResolver()..aliasId = aliasId;
}

class NameResolver extends Object
    with Scalar<String>, Alias
    implements GQLField {
  @override
  String get name => 'name';

  @override
  NameResolver clone() => NameResolver()..aliasId = aliasId;
}

class CreatedAtResolver extends Object
    with Scalar<String>, Alias
    implements GQLField {
  @override
  String get name => 'createdAt';

  @override
  CreatedAtResolver clone() => CreatedAtResolver()..aliasId = aliasId;
}

class IdResolver extends Object with Scalar<String>, Alias implements GQLField {
  @override
  String get name => 'id';

  @override
  IdResolver clone() => IdResolver()..aliasId = aliasId;
}

class BodyResolver extends Object
    with Scalar<String>, Alias
    implements GQLField {
  @override
  String get name => 'body';

  @override
  BodyResolver clone() => BodyResolver()..aliasId = aliasId;
}
