;; 7. Create a situation with `unreachable` within a `br_if` condition inside a nested loop whose condition needs to evaluate but should trap if executed. Validate that `unreachable` indeed traps before any label resolution from `br_if`.

(assert_invalid
  (module (func $type-br_if-unreachable-nested-loop (result i32)
    (loop (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 1 (unreachable) (i32.const 1))
        )
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)