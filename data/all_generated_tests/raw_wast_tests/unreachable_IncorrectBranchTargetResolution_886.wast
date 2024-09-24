;; 7. **Test Unreachable Before Loop End and Multiple Branches:**    - Place `unreachable` before a loop end, with multiple `br` instructions targeting various outer blocks.    - *Constraint*: Evaluates accurate resolution of multiple branch targets around loop boundaries.    - *Relation to Branch Resolution*: Ensures branches within and outside loops are resolved without skipping `unreachable`.

(assert_invalid
  (module (func $test-unreachable-before-loop-end-multiple-branches
    (block $outer_block
      (loop $inner_loop
        unreachable 
        (br $outer_block)
        (br $inner_loop)
      )
    )
  ))
  "unreachable instruction should trap before branches"
)