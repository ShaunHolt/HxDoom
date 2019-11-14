package packages.actors;

/**
 * ...
 * @author Kaelan
 * 
 * Taking the GZDoom approach here and having each class type behave on inheritance rather than each possesing their own properties.
 */
class Thing 
{
	public var id:Int;
	public var xpos(default, set):Int;
	public var ypos(default, set):Int;
	public var angle(default, set):Int;
	public var type:TypeID;
	public var group:TypeGroup;
	
	public var isPlayer(get, never):Bool;
	public var isMonster(get, never):Bool;
	
	public function new(_id:Int) 
	{
		id = _id;
		group = TypeGroup.UNDEFINED;
	}
	
	//Setters
	function set_xpos(value:Int):Int 
	{
		return xpos = value;
	}
	function set_ypos(value:Int):Int 
	{
		return ypos = value;
	}
	function set_angle(value:Int):Int 
	{
		return angle = value;
	}
	
	//getters
	function get_isMonster():Bool 
	{
		switch (type) {
			case	TypeID.M_SPIDERMASTERMIND | M_FORMERSERGEANT | TypeID.M_CYBERDEMON |
					TypeID.M_DEADFORMERHUMAN | TypeID.M_DEADFORMERSERGEANT | TypeID.M_DEADIMP | TypeID.M_DEADDEMON |
					TypeID.M_DEADCACODEMON | TypeID.M_DEADLOSTSOUL | TypeID.M_SPECTRE | TypeID.M_ARCHVILE |
					TypeID.M_FORMERCOMMANDO | TypeID.M_REVENANT | TypeID.M_MANCUBUS | TypeID.M_ARACHNOTRON |
					TypeID.M_HELLKNIGHT | TypeID.M_PAINELEMENTAL | TypeID.M_COMMANDERKEEN | TypeID.M_WOLFSS |
					TypeID.M_SPAWNSPOT | TypeID.M_BOSSBRAIN | TypeID.M_BOSSSHOOTER | TypeID.M_IMP |
					TypeID.M_DEMON | TypeID.M_BARONOFHELL | TypeID.M_FORMERTROOPER | TypeID.M_CACODEMON |
					TypeID.M_LOSTSOUL
					:
						return true;
			default :
						return false;
		}
	}
	function get_isPlayer():Bool 
	{
		switch (type) {
			case TypeID.P_PLAYERONE | TypeID.P_PLAYERTWO | TypeID.P_PLAYERTHREE | TypeID.P_PLAYERFOUR :
				return true;
			default :
				return false;
		}
	}
}