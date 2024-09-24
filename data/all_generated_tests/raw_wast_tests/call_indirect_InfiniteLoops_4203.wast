;; 2. **Test Description**: Implement a `loop` with `call_indirect` that dynamically changes the function index to an out-of-bounds value, resulting in a trap.    - *Constraint Checked*: Boundary conditions for table indexing.    - *Infinite Loop Context*: The trap must prevent the loop from indefinitely iterating over invalid indexes.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 0 funcref)
    (func $test
      (local $index i32)
      (block
        (loop
          (local.get $index)
          (call_indirect (type $sig) (i32.add (local.get $index) (i32.const 1)))
          (br 1)
        )
      )
    )
  )
  "out of bounds table access"
)