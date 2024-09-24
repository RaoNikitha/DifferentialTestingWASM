;; 6. **Label Vector Misalignment within Block:**    `br_table` within a block where label vector indices do not align with the block's labels, causing potential branching to undefined targets. This will check if the CFG properly identifies misalignments and handles or traps accordingly.

(assert_invalid
 (module (func $label-vector-misalignment
   (block (loop (br_table 1 2 0 (i32.const 1))))
 ))
 "unknown label"
)