;; 6. **Test Call Leading to Mutual Recursion Error**:    Develop functions that mutually call each other but violate the type checking rules, causing the recursion to hit an `unreachable` instruction due to signature mismatches not properly handled.

(assert_invalid
  (module
    (func $a (param i32) (call $b (i32.const 42)))
    (func $b (param i32) (call $a (i32.const 43)))
  )
  "unreachable due to mutual recursion type mismatch"
)