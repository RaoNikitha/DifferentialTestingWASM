;; Test 1: Insert an `unreachable` instruction at the beginning of a function followed by an `i32.add` operation. This tests if the engine interprets the addition operation, which should be ignored.

(assert_invalid
  (module (func $unreachable-add
    (unreachable) (i32.const 1) (i32.const 2) (i32.add)
  ))
  "type mismatch"
)