;; 9. Create a sequence where `br_table` is followed by a `nop`, and the branch index references an outer block’s label. This will check if `nop` might interfere with the scope resolution of nested labels during `br_table` computation.

(assert_invalid
  (module
    (func (block $outer
            (br_table 0 (nop))
            $outer))) 
  "type mismatch"
)