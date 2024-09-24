;; 7. Place `nop` within a switch-case-like structure (chain of `br_if`) checking different conditions. Observe if the branches taken match expected outcomes, indicating proper evaluation despite `nop`.

(assert_invalid
  (module
    (func $test-switch (param i32) (result i32)
      local.get 0
      i32.const 0
      i32.eq
      br_if 0
      nop
      local.get 0
      i32.const 1
      i32.eq
      br_if 0
      nop
      local.get 0
    )
  )
  "undeclared label"
)