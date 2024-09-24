;; 4. **Test Description:** Create a series of nested `loop` constructs where an inner loop contains a `br` to an outer loop. Ensure the test can confirm accurate execution flow resuming at the beginning of the targeted loop, highlighting possible CFG issues in wizard_engine with backward jumps.

(assert_invalid
 (module
  (func $nested_loops (result i32)
   (loop $outer (result i32)
    (loop $inner
     (br $outer)
     (unreachable)
    )
    (i32.const 0)
   )
  )
 )
"label index out of bound")