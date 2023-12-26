# manifest

jemaos anchors revisions of upstream projects in file `chromiumos.xml`:

<!-- markdownlint-disable line-length -->
```xml
<manifest>
  <!-- .... -->
  <extend-project name="chromiumos/overlays/chromiumos-overlay" path="src/third_party/chromiumos-overlay" revision="refs/heads/release-R96-14268.B-jemaos" origRev="refs/heads/release-R96-14268.B" />
  <extend-project name="chromiumos/overlays/portage-stable" path="src/third_party/portage-stable" revision="release-R96-14268.B-jemaos" origRev="refs/heads/release-R96-14268.B" />
  <extend-project name="chromium/tools/depot_tools" path="src/chromium/depot_tools" revision="release-R96-14268.B-jemaos" origRev="09f358bae36c316e3c4c39cd344de964bd0fed7c" />
  <!-- .... -->
</manifest>
```
<!-- markdownlint-enable line-length -->

Basically, `chromiumos.xml` doesn't change in one release life cycle.

The `jemaos.xml` contains projects which jemaos owns.
The projects are necessary for building jemaos for board `amd64-jemaos`.

