;; Test misaligned stacks where `br_if` conditions should be evaluated with values leading to an `unreachable`. Ensure that changes in condition values do not result in incorrect execution beyond the trap.

(assert_invalid
  (module (func $test-unreachable-misaligned-stack
    (block (result i32)
      (br_if 0 (block (result i32)
        (unreachable)
        (i32.const 1)
      ))
    )
  ))
  "type mismatch"
)