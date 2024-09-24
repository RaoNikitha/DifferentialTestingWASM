;; 8. **Test Unreachable Within Block Leading to Multiple Nested Structures:**    - Utilize `unreachable` within a block that leads to multiple nested structures, followed by `br` to different levels.    - *Constraint*: Ensures that multi-level branching respects the `unreachable` placement for correct flow resolution.    - *Relation to Branch Resolution*: Verifies branching into deeper nested structures from traps.

(assert_invalid
  (module
    (func (result i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (unreachable)
          (br $outer)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)