;; Test a `loop` block with a `br_table` instruction where the indices refer to a mix of valid loop and non-loop targets, ensuring correct branching to both types of targets and proper stack unwinding.

(assert_invalid
 (module
   (func
     (block $out
       (loop $in
         (block $mid
           (br_table 0 1 2 (i32.const 0))
         )
       )
     )
   )
 )
 "type mismatch"
)