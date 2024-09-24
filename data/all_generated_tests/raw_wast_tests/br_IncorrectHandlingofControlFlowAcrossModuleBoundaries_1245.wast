;; 6. **Test Description:**    - Import a function that contains nested `block` and `loop` constructs with `br` instructions targeting both forward and backward branches.    - Test that calling this function correctly manages branching within both constructs and does not violate nesting constraints.    - **Constraint:** Check the enforcement of structured control flow and correct branch target handling within nested constructs from different modules.

(assert_invalid
  (module
    (func $nested_blocks_and_loops
      (block
        (loop
          (block
            (br 2)  ;; Forward branch to outer block
          )
          (br 1)  ;; Backward branch to start of loop
        )
      )
    )
  )
  "type mismatch"
)