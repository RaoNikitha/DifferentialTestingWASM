;; 7. Develop a module where an `if` block expects a specific type (`f32`), but the branch (`br`) inside it erroneously targets an outer `block` expecting `i32` types. This verifies the type checking on branches affecting `if` blocks and their surrounding control structures.

(assert_invalid
  (module
    (func $mismatched-types-in-if-block
      (block (br 0 (i32.const 0)))
      (if (result f32) (then (br 1 (f32.const 0.0))))
      (drop)
    )
  )
  "type mismatch"
)