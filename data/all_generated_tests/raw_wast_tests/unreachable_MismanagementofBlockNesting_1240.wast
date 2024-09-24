;; 1. Test an `unreachable` inside a deeply nested loop, followed by a `br_table` instruction to different levels of nesting. This tests if the `br_table` properly manages block depths after encountering an `unreachable`, ensuring that proper control flow is maintained.

(assert_invalid
  (module (func $deeply_nested_unreachable_br_table
    (block (loop (loop (loop (loop
      (unreachable)
      (br_table 0 1 2 3 (i32.const 1))
    ))))
  )))
  "type mismatch"
)