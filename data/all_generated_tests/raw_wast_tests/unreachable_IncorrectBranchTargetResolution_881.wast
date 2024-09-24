;; 2. **Test Unreachable in Nested Block with Backward Branch:**    - Place `unreachable` in a nested block within another block, followed by a `br` that targets the outer block.    - *Constraint*: Checks if the backward branch exits the correct block and outer execution is resumed.    - *Relation to Branch Resolution*: Tests correctness of resolving backward targets in nested structures.

(assert_invalid
  (module (func $nested-block-unreachable-br (result i32)
    (block (result i32)
      (block (unreachable) (br 1))
    )
  ))
  "type mismatch"
)