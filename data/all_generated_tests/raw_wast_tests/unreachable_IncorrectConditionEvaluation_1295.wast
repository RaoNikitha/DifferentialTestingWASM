;; 6. Test conditional branches with multiple levels of conditions, where each level includes `unreachable`. Check for proper condition evaluation across levels. Constraint: Ensures multi-level condition evaluation does not bypass traps. Example: `(i32.const 1) (if (then (i32.const 0) (br_if 0 (unreachable))))`

(assert_invalid
  (module (func $multi-level-conditional-unreachable
    (i32.const 1) (if (then (i32.const 0) (br_if 0 (unreachable))))
  ))
  "type mismatch"
)