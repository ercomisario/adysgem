<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Invoice_model extends CI_Model
{

    var $table = 'sales';

    var $column = array(
        'id',
        'clientname',
        'tax',
        'discount',
        'total',
        'created_by',
        'totalitems'
    );

    var $order = array(
        'id' => 'desc'
    );

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    private function _get_datatables_query()
    {
        $this->db->from($this->table);
        
        $i = 0;
        $where_like = "("; 
        $or_counter = 1;
        foreach ($this->column as $item) {
            if ($_POST['search']['value'])
                $_POST['search']['value'] = ltrim($_POST['search']['value'], '0');
            //($i === 0) ? $this->db->like($item, $_POST['search']['value']) : $this->db->or_like($item, $_POST['search']['value']);
            $or_content = ($or_counter > 1) ?'OR': '';
            $newlikeval = $_POST['search']['value'];
            $where_like .= $or_content." `$item` LIKE  '%$newlikeval%' ";
            $or_counter++;
            
            $column[$i] = $item;
            $i ++;
        }
        $where_like .= ")";
        $this->db->where($where_like);
        $tiposale = $this->input->post("tiposale");
        //echo "Aqui DB".$tiposale;
        if($tiposale>0)
            $this->db->where('status >', 0);
        //else
          //  $this->db->where('status', 0);


        
        if (isset($_POST['order'])) // here order processing
{
            $this->db->order_by($column[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } else 
            if (isset($this->order)) {
                $order = $this->order;
                $this->db->order_by(key($order), $order[key($order)]);
            }
    }

    function get_datatables()
    {
        $this->_get_datatables_query();
        
        if ($_POST['length'] != - 1)
            $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        //echo "Aqui. ".$this->db->last_query();      
        return $query->result();
    }

    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    public function get_by_id($id)
    {
        $this->db->from($this->table);
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->row();
    }

    public function save($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    public function update($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }

    public function delete_by_id($id)
    {
        $this->db->where('id', $id);
        $this->db->delete($this->table);
    }
}
