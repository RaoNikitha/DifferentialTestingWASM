;; 3. Insert multiple consecutive `nop` instructions within a `loop` containing a control structure that should break the loop. Test if the `nop` affects loop control and leads to infinite execution.

(assert_invalid
  (module
    (func (loop
      (nop) (nop) (nop)
      (br 0)))) 
  "type mismatch"
)