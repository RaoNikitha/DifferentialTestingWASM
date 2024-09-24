;; 6. Test Description 6: Place a `call_indirect` instruction with an out-of-bounds table index inside a nested structure where a `br_if` condition evaluates to true multiple levels deep. The goal is to see if it correctly interrupts the sequence and traps.

(assert_invalid
  (module
    (type (func (param i32) (result)))
    (table funcref (elem))
    (func
      (block
        (loop
          (call_indirect (type 0) (i32.const 1)) ; out-of-bounds table index
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "out of bounds table index"
)