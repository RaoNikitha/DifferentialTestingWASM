;; 6. **Test Description:**    - Place `unreachable` in the middle of a sequence containing a loop with mixed types (e.g., starting with `i32`, looping with `i64`). Validate the type resolution before and after `unreachable`.    - **Constraint Checked:** Checks proper type consistency before and after `unreachable` within type-mixed loops.    - **Relation to Type Mismatch:** Identifies issues where polysemous stack handling could cause type inconsistencies in loops containing `unreachable`.

(assert_invalid
  (module (func $type-unreachable-mixed-loop
    (loop $L1 (i32.const 0) (br_if $L1 (i64.const 1)) (unreachable) (i32.add))
  ))
  "type mismatch"
)