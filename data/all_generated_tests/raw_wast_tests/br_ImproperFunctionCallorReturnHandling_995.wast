;; 6. **Test Description:** Two nested `loop` instructions within a function where an indirect function call happens in the innermost loop, and this function has a `br` targeting the outer loop.    **Constraint Checked:** Proper backward label resolution by `br` following nested loops with indirect calls.    **Relation to Function Call/Return Handling:** Checks jumping to correct loop starts without mismanaging return handling in nested loops.

(assert_invalid
  (module
    (func $nested_loops_with_br
      (loop
        (loop
          (call_indirect (type $t) (i32.const 0))  ;; assuming a suitable function type $t
          (br 1)   ;; this should target the outer loop
        )
      )
    )
  )
  "type mismatch"
)