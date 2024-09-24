;; 8. **Call_indirect within mixed block and loop contexts triggering multiple traps**:    - **Description**: Combine blocks and loops with multiple indirect calls where some should trap due to type mismatches and others due to stack insufficiency from the call context, under varied nesting depths.    - **Expected outcome**: Ensure distinct trapping for both scenarios, adequately handled within all nested contexts.

(assert_invalid
 (module
   (type (func (result i32)))
   (type (func (param i32) (result f32)))
   (table 2 funcref)
   (elem (i32.const 0) $func1 $func2)
   (func $func1 (result i32)
     (i32.const 42))
   (func $func2 (param i32) (result f32)
     (f32.const 1.0))
   (func $test
     (block
       (loop
         (call_indirect (type 0) (i32.const 1))  ;; Should trap due to type mismatch
         (call_indirect (type 1) (i32.const 1))  ;; Should pass
         (br 1)
       )
     )
     (call_indirect (type 0) (i32.const 0))      ;; Should pass
     (call_indirect (type 1) (i32.const 2))      ;; Should trap due to index out of bounds
   )
 )
 "type mismatch"
)