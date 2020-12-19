// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(num)),
      'runtime',
      serializers.serialize(object.runtime, specifiedType: const FullType(int)),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
      'background_image',
      serializers.serialize(object.background,
          specifiedType: const FullType(String)),
      'medium_cover_image',
      serializers.serialize(object.mediumCover,
          specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.largeCover,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'background_image':
          result.background = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'medium_cover_image':
          result.mediumCover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'large_cover_image':
          result.largeCover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String url;
  @override
  final String title;
  @override
  final int year;
  @override
  final num rating;
  @override
  final int runtime;
  @override
  final String summary;
  @override
  final String background;
  @override
  final String mediumCover;
  @override
  final String largeCover;

  factory _$Movie([void Function(MovieBuilder) updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.url,
      this.title,
      this.year,
      this.rating,
      this.runtime,
      this.summary,
      this.background,
      this.mediumCover,
      this.largeCover})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('Movie', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Movie', 'title');
    }
    if (year == null) {
      throw new BuiltValueNullFieldError('Movie', 'year');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Movie', 'rating');
    }
    if (runtime == null) {
      throw new BuiltValueNullFieldError('Movie', 'runtime');
    }
    if (summary == null) {
      throw new BuiltValueNullFieldError('Movie', 'summary');
    }
    if (background == null) {
      throw new BuiltValueNullFieldError('Movie', 'background');
    }
    if (mediumCover == null) {
      throw new BuiltValueNullFieldError('Movie', 'mediumCover');
    }
    if (largeCover == null) {
      throw new BuiltValueNullFieldError('Movie', 'largeCover');
    }
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        url == other.url &&
        title == other.title &&
        year == other.year &&
        rating == other.rating &&
        runtime == other.runtime &&
        summary == other.summary &&
        background == other.background &&
        mediumCover == other.mediumCover &&
        largeCover == other.largeCover;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, url.hashCode), title.hashCode),
                                year.hashCode),
                            rating.hashCode),
                        runtime.hashCode),
                    summary.hashCode),
                background.hashCode),
            mediumCover.hashCode),
        largeCover.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('url', url)
          ..add('title', title)
          ..add('year', year)
          ..add('rating', rating)
          ..add('runtime', runtime)
          ..add('summary', summary)
          ..add('background', background)
          ..add('mediumCover', mediumCover)
          ..add('largeCover', largeCover))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  num _rating;
  num get rating => _$this._rating;
  set rating(num rating) => _$this._rating = rating;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  String _summary;
  String get summary => _$this._summary;
  set summary(String summary) => _$this._summary = summary;

  String _background;
  String get background => _$this._background;
  set background(String background) => _$this._background = background;

  String _mediumCover;
  String get mediumCover => _$this._mediumCover;
  set mediumCover(String mediumCover) => _$this._mediumCover = mediumCover;

  String _largeCover;
  String get largeCover => _$this._largeCover;
  set largeCover(String largeCover) => _$this._largeCover = largeCover;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _title = _$v.title;
      _year = _$v.year;
      _rating = _$v.rating;
      _runtime = _$v.runtime;
      _summary = _$v.summary;
      _background = _$v.background;
      _mediumCover = _$v.mediumCover;
      _largeCover = _$v.largeCover;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    final _$result = _$v ??
        new _$Movie._(
            url: url,
            title: title,
            year: year,
            rating: rating,
            runtime: runtime,
            summary: summary,
            background: background,
            mediumCover: mediumCover,
            largeCover: largeCover);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
