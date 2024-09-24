;; Construct a nested `block` within another `block`, each with different `blocktypes`. Use `br_if` in the inner `block` to branch conditionally based on a value that should result in branching to an outer block. Confirm that the inner `br_if` does not cause incorrect outer block execution paths.

(assert_invalid
  (module (func $nested-block-branch (param i32) (result i32)
    (block (result i32)
      (block (result i32)
        (br_if 1 (local.get 0))
        (i32.const 42)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)