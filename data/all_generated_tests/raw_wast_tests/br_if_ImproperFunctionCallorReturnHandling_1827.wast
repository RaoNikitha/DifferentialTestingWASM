;; 8. Design a test where `br_if` in a `loop` conditionally calls a function that itself contains a `br_if`. This will test if the wizard_engine’s explicit fetching of label arguments handles nested `br_if` calls and returns correctly, maintaining proper type expectations.

(assert_invalid
  (module
    (func $nested-br_if-test (param i32) (result i32)
      (block $outer
        (loop $inner
          (call $helper (local.get 0))
          (br_if $inner (i32.const 1))
        )
      )
    )
    (func $helper (param i32) (result i32)
      (block $helper_block
        (br_if $helper_block (local.get 0))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)