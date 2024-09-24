;; 2. **Indirect call within a complex loop structure with type mismatch**:    - **Description**: Set up a loop inside which there are nested blocks with an indirect function call pointing to a function of incorrect type. Verify if the loop's body is correctly managed and if a type mismatch correctly causes a trap.    - **Expected outcome**: Verify that both engines trap as expected purely based on type mismatch, irrespective of the loop's complexity.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (type $sig1) (param i32) (result i32)
      local.get 0)
    (func $main
      (block $loop
        (loop $l
          (call_indirect (type $sig2) (i32.const 0) (f64.const 42.0))
        )
      )
    )
  )
  "type mismatch"
)