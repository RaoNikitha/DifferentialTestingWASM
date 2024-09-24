;; 9. **Test with `unreachable` after stack polymorphic operations:**    - Sequence polymorphic ops like `drop` and `select` followed by an `unreachable`, checking how the stack status impacts the trap.    - **Constraint:** Validates stack consistency and how well polymorphic operations are handled following an unreachable.    - **Related to**: Ensures stack manipulations do not interfere with expected unreachable behaviors.

(assert_invalid
  (module (func $test-unreachable-after-polymorphic-ops
    (drop (unreachable)) (drop (select (i32.const 1) (i32.const 2) (i32.const 3)))))
  "type mismatch"
)