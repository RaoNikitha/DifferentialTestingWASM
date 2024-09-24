;; 2. A `call` instruction within a nested `block` structure followed by a `br` instruction that should resume after the `end` of the `block` but wrongly returns the call's return value due to improper stack handling differences.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 42)
        (call $dummy)
        (br 0)
      )
      (drop)
    )
    (func $dummy (result i32)
      (i32.const 99)
    )
  )
  "type mismatch"
)