;; 10. **Test with Immediate Trap Following an Outer Branch:** Use a sequence where an initial block contains an outer branch and an `unreachable` instruction immediately follows. This tests whether `unreachable` is precisely honored, causing a trap without any further improper branch resolution past the `unreachable` point.

(assert_invalid
  (module (func $immediate-trap-follow/outer-branch
    (block (br 0) (unreachable))
  ))
  "type mismatch"
)